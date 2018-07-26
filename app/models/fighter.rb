class Fighter < ApplicationRecord
  mount_uploader :picture, PictureUploader
  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
