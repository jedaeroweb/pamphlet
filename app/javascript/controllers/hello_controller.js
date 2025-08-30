import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

export default class extends Controller {
    static targets = ["modal", "galleryImage", "blogImage"]  // 타겟 정의 추가

    connect() {
        // 페이지 로드 시 세션 스토리지 체크
        if (!sessionStorage.getItem('modalShown')) {
            this.showModal()
            sessionStorage.setItem('modalShown', 'true')
        }

        // 각 이미지 그룹 독립적으로 처리
        this.loadGalleryImages()
        this.loadBlogImages()
    }

    // 갤러리 이미지 처리
    loadGalleryImages() {
        // galleryImageTargets가 존재하는 경우에만 처리
        if (this.hasGalleryImageTarget) {
            this.galleryImageTargets.forEach(img => {
                const originalSrc = img.getAttribute('data-original')
                if (originalSrc) {
                    img.src = originalSrc
                    img.removeAttribute('data-original')
                }
            })
        }
    }

    // 블로그 이미지 처리
    loadBlogImages() {
        // blogImageTargets가 존재하는 경우에만 처리
        if (this.hasBlogImageTarget) {
            this.blogImageTargets.forEach(img => {
                const originalSrc = img.getAttribute('data-original')
                if (originalSrc) {
                    img.src = originalSrc
                    img.removeAttribute('data-original')
                }
            })
        }
    }

    showModal() {
        fetch('/home/demo')
            .then(response => response.text())
            .then(html => {
                this.modalTarget.innerHTML = html
                const myModal = new Modal(this.modalTarget)
                myModal.show()
            })
    }
}

