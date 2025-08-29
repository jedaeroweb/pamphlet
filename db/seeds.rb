
User.create!(id: 1, email:'admin@jedaeroweb.co.kr',:nickname=>'잠자는사자',:password => 'jedaeroweb12345', :password_confirmation => 'jedaeroweb12345',:photo=>File.open(Rails.root.join("app", "assets", "images", "intro", "sl.jpg")),:admin=>true)

GalleryCategory.create!(title: 'A,B,C,D 타입')
GalleryCategory.create!(title: 'E,F 타입')
GalleryCategory.create!(title: 'G 타입')

Gallery.create!(gallery_category_id: 1, title: 'A타입 전경', content: 'A타입 전경',:photo=>File.open(Rails.root.join("app", "assets", "images", "1.jpg")))
Gallery.create!(gallery_category_id: 1, title: 'A타입 전경', content: 'A타입 전경',:photo=>File.open(Rails.root.join("app", "assets", "images", "2.jpg")))
Gallery.create!(gallery_category_id: 1, title: 'A타입 전경', content: 'A타입 전경',:photo=>File.open(Rails.root.join("app", "assets", "images", "3.jpg")))
Gallery.create!(gallery_category_id: 1, title: 'A타입 전경', content: 'A타입 전경',:photo=>File.open(Rails.root.join("app", "assets", "images", "4.jpg")))
Gallery.create!(gallery_category_id: 2, title: 'A타입 전경', content: 'A타입 전경',:photo=>File.open(Rails.root.join("app", "assets", "images", "1.jpg")))
Gallery.create!(gallery_category_id: 2, title: 'A타입 전경', content: 'A타입 전경',:photo=>File.open(Rails.root.join("app", "assets", "images", "2.jpg")))
Gallery.create!(gallery_category_id: 3, title: 'A타입 전경', content: 'A타입 전경',:photo=>File.open(Rails.root.join("app", "assets", "images", "3.jpg")))
Gallery.create!(gallery_category_id: 3, title: 'A타입 전경', content: 'A타입 전경',:photo=>File.open(Rails.root.join("app", "assets", "images", "4.jpg")))

ContactCategory.create!(title: '투자')
ContactCategory.create!(title: '거주')

BlogCategory.create!(id: 1, title: '상세소개')
BlogCategory.create!(id: 2, title: '주변환경')
BlogCategory.create!(id: 3, title: '현장모습')
BlogCategory.create!(id: 4, title: 'A~D Type')
BlogCategory.create!(id: 5, title: 'EF Type')
BlogCategory.create!(id: 6, title: 'G Type')
BlogCategory.create!(id: 7, title: '영통역')
BlogCategory.create!(id: 8, title: '반달공원')

Blog.create!(id: 1, user_id: 1, blog_category_id: 1, title: '잠자는-사자의 집이 다시 개장했습니다', description: '설명 읗믄ㅇ힘낭흐민ㅇㅎ ', content: '그동안 수많은 방문자에 비해서 준비되지 못하였는데 이제 보다 업그레이드된 모습으로 다시 찾아뵙게되었습니다.
    잠자는-사자와 소통하는 공간으로 계속 많은 이용바랍니다.')

Notice.create!(id: 1, user_id: 1, title: '방문을 환경합니다.',content: '고객등록을 해주시면 자세한 상담이 가능합니다.
마지막 남은 이번 기회 절대 놓치지 않도록 고객등록 하고 상담받으세요~')
 