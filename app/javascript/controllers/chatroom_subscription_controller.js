import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "form"]

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }
}
