crumb :root do
  link t(:home), root_path
end

crumb :contacts do
   link t('activerecord.models.contact'), contacts_path
end

crumb :histories do
   link t('activerecord.models.history'), histories_path
end

crumb :intro do
   link t('activerecord.models.intro'), intro_index_path
end

crumb :locations do
   link t('activerecord.models.location'), locations_path
end

crumb :blogs do
   link t('activerecord.models.blog'), blogs_path
end

crumb :blog do |blog|
   link blog.title, blog_path(blog)
   parent :blogs
end

crumb :galleries do
   link t('activerecord.models.gallery'), galleries_path
end

crumb :gallery do |gallery|
   link gallery.title, gallery_path(gallery)
   parent :galleries
end

crumb :faqs do
   link t('activerecord.models.faq'), faqs_path
end

crumb :faq do |faq|
   link faq.title, faq_path(faq)
   parent :faqs
end

crumb :notices do
   link t('activerecord.models.notice'), notices_path
end

crumb :notice do |notice|
   link notice.title, notice_path(notice)
   parent :notices
end
