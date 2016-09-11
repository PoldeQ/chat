import {Socket} from "phoenix"

let socket = new Socket("/socket",{})
socket.connect()

let roomId = $('#room-id').text()
let channel = socket.channel(`room:${roomId}`, {})
let messagesContainer = $('#chat-box')
let user = $('#current-user').text()

channel.on("new_msg", payload => {
  messagesContainer.append(`<br/>[${user}]: ${payload.body}`)
})
channel.join()

let chatInput = $('#chat-input')
chatInput.on('keypress', event => {
  if(event.keyCode == 13) {
    channel.push("new_msg", {body: chatInput.val(), user: user, room_id: roomId});
    chatInput.val("")
  }
})

export default socket
