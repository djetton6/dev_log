class Developer < ApplicationRecord

    has_many :skills
    has_many :developer_ethos

    accepts_nested_attributes_for :skills,
                                  reject_if: proc { |skills| skills['name'].blank? },
                                  allow_destroy: true
    accepts_nested_attributes_for :developer_ethos,
                                  reject_if: proc { |attributes| attributes['step'].blank? },
                                  allow_destroy: true

    validates :title, :description, :image, presence: true                              
    has_attached_file :image, styles: { medium: "400x400#>" }
    # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
