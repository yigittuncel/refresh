import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["confirm", "reject", "content"]

  reject(){
    console.log("Reject")
  }

  confirm(){
    console.log("Confirm")
  }


}
