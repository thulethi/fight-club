class Fighter < ApplicationRecord
  mount_uploader :picture, PictureUploader
  def self.search(term)
    if term
      where('lower(name) LIKE ?', "%#{term.downcase}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
