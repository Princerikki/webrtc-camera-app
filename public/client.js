const socket = io();
const localVideo = document.getElementById("localVideo");
const remoteVideos = document.getElementById("remoteVideos");

const peers = {};
const room = "default-room";

navigator.mediaDevices.getUserMedia({ video: true, audio: false }).then(stream => {
  localVideo.srcObject = stream;

  socket.emit("join", room);

  socket.on("user-joined", id => {
    const pc = createPeerConnection(id);
    stream.getTracks().forEach(track => pc.addTrack(track, stream));
    pc.createOffer().then(offer => {
      pc.setLocalDescription(offer);
      socket.emit("offer", { to: id, offer });
    });
  });

  socket.on("offer", async ({ from, offer }) => {
    const pc = createPeerConnection(from);
    await pc.setRemoteDescription(new RTCSessionDescription(offer));
    stream.getTracks().forEach(track => pc.addTrack(track, stream));
    const answer = await pc.createAnswer();
    await pc.setLocalDescription(answer);
    socket.emit("answer", { to: from, answer });
  });

  socket.on("answer", async ({ from, answer }) => {
    await peers[from].setRemoteDescription(new RTCSessionDescription(answer));
  });

  socket.on("ice-candidate", ({ from, candidate }) => {
    peers[from].addIceCandidate(new RTCIceCandidate(candidate));
  });

  socket.on("user-left", id => {
    if (peers[id]) {
      peers[id].close();
      delete peers[id];
      const video = document.getElementById(id);
      if (video) video.remove();
    }
  });

  function createPeerConnection(id) {
    const pc = new RTCPeerConnection();
    peers[id] = pc;

    pc.onicecandidate = event => {
      if (event.candidate) {
        socket.emit("ice-candidate", { to: id, candidate: event.candidate });
      }
    };

    pc.ontrack = event => {
      let video = document.getElementById(id);
      if (!video) {
        video = document.createElement("video");
        video.id = id;
        video.autoplay = true;
        video.playsInline = true;
        remoteVideos.appendChild(video);
      }
      video.srcObject = event.streams[0];
    };

    return pc;
  }
});
