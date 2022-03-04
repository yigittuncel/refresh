import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["confirm", "reject", "content", "card"]

  update(url, formData) {
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(formData)
    })
      .then(response => response.text())
      .then((data) => {
        this.cardTarget.outerHTML = data
      })
  }

  confirm(event) {
    event.preventDefault()
    const url = this.confirmTarget.action
    const formData = this.confirmTarget
    this.update(url, formData)
  }

  reject(event) {
    event.preventDefault()
    const url = this.rejectTarget.action
    const formData = this.rejectTarget
    this.update(url, formData)
  }
}
