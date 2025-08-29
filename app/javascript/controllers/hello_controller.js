import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"


export default class extends Controller {
    static targets = ["modal"]  // 타겟 정의 추가


    connect() {
    // 페이지 로드 시 세션 스토리지 체크
    if (!sessionStorage.getItem('modalShown')) {
      this.showModal()
      // 모달을 표시했다고 세션에 기록
      sessionStorage.setItem('modalShown', 'true')
    }
  }

    showModal() {
        fetch('/home/demo')
            .then(response => response.text())
            .then(html => {
                // this.modalTarget을 사용하여 모달 엘리먼트 참조
                this.modalTarget.innerHTML = html

                const myModal = new Modal(this.modalTarget)
                myModal.show()
            })
    }
}