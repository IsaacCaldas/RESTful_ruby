class Contact < ApplicationRecord

  #Validations
  validates_presence_of :kind
  # validates_presence_of :address

  # Kaminari
  paginates_per 5

  # Associations
  has_many :phones
  has_one :address
  belongs_to :kind # optional: true
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  # def as_json(options={})
  #   hash = super(options)
  #   hash[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   hash
  # end

  # def birthdate_br
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end

  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  # end
  
  # def author
  #   "Isaac"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(methods: [:kind_description, :author])
  # end

  # def hello
  #   I18n.t('hello')
  # end

end
