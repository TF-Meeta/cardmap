import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "checkbox" ]

  connect() {
    this.checkboxTargets.forEach(checkbox => {
      checkbox.addEventListener("change", (e) => {
        const postId = e.target.dataset.post_id
        const checked = e.target.checked

        fetch(`/card_posts/${postId}/toggle_checked`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
          },
          body: JSON.stringify({ checked_by_owner: checked })
        })
      })
    })
  }
}
