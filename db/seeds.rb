
User.create(:id=>1,:email => 'toughjjh@gmail.com',:name=>'정종호',:password => 'jjh123456', :password_confirmation => 'jjh123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "intro", "sl.jpg")),:admin=>true)

GalleryCategory.create(:title=>'A,B,C,D 타입')
GalleryCategory.create(:title=>'E,F 타입')
GalleryCategory.create(:title=>'G 타입')

Gallery.create!(gallery_category_id: 1, title: '멋진나1', content: '멋진나1',:photo=>File.open(Rails.root.join("app", "assets", "images", "1.jpg")))
Gallery.create!(gallery_category_id: 1, title: '멋진나2', content: '멋진나2',:photo=>File.open(Rails.root.join("app", "assets", "images", "2.jpg")))
Gallery.create!(gallery_category_id: 1, title: '멋진나3', content: '멋진나3',:photo=>File.open(Rails.root.join("app", "assets", "images", "3.jpg")))
Gallery.create!(gallery_category_id: 1, title: '멋진나4', content: '멋진나4',:photo=>File.open(Rails.root.join("app", "assets", "images", "4.jpg")))
Gallery.create!(gallery_category_id: 2, title: '멋진나5', content: '멋진나1',:photo=>File.open(Rails.root.join("app", "assets", "images", "1.jpg")))
Gallery.create!(gallery_category_id: 2, title: '멋진나6', content: '멋진나2',:photo=>File.open(Rails.root.join("app", "assets", "images", "2.jpg")))
Gallery.create!(gallery_category_id: 3, title: '멋진나7', content: '멋진나3',:photo=>File.open(Rails.root.join("app", "assets", "images", "3.jpg")))
Gallery.create!(gallery_category_id: 3, title: '멋진나8', content: '멋진나4',:photo=>File.open(Rails.root.join("app", "assets", "images", "4.jpg")))

ContactCategory.create(:user_id=>1,:title=>'투자')
ContactCategory.create(:user_id=>1,:title=>'거주')

BlogCategory.create(:id=>1,:user_id=>1,:leaf=>false,:title=>'상세소개')
BlogCategory.create(:id=>2,:user_id=>1,:leaf=>false,:title=>'주변환경')
BlogCategory.create(:id=>3,:user_id=>1,:leaf=>false,:title=>'현장모습')
BlogCategory.create(:id=>6,:user_id=>1,:blog_category_id=>1,:leaf=>true,:title=>'A~D Type')
BlogCategory.create(:id=>7,:user_id=>1,:blog_category_id=>1,:leaf=>true,:title=>'EF Type')
BlogCategory.create(:id=>8,:user_id=>1,:blog_category_id=>1,:leaf=>true,:title=>'G Type')
BlogCategory.create(:id=>9,:user_id=>1,:blog_category_id=>1,:leaf=>true,:title=>'사진첩')
BlogCategory.create(:id=>10,:user_id=>1,:blog_category_id=>2,:leaf=>true,:title=>'영통역')
BlogCategory.create(:id=>11,:user_id=>1,:blog_category_id=>2,:leaf=>true,:title=>'반달공원')

Blog.create(:id=>1,:blog_category_id=>1,:user_id=>1,:title=>'잠자는-사자의 집이 다시 개장했습니다',:description=>'설명 읗믄ㅇ힘낭흐민ㅇㅎ ')
BlogContent.create(:id=>1,:content=>'그동안 수많은 방문자에 비해서 준비되지 못하였는데 이제 보다 업그레이드된 모습으로 다시 찾아뵙게되었습니다.
    잠자는-사자와 소통하는 공간으로 계속 많은 이용바랍니다.')

Notice.create(:id=>1,:user_id=>1,:title=>'잠자는-사자의 집이 다시 개장했습니다.')
NoticeContent.create(:id=>1,:content=>'그동안 수많은 방문자에 비해서 준비되지 못하였는데 이제 보다 업그레이드된 모습으로 다시 찾아뵙게되었습니다.
    잠자는-사자와 소통하는 공간으로 계속 많은 이용바랍니다.')
 