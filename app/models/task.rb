class Task < ApplicationRecord
  belongs_to :user
  # before_validation :set_nameless_name
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma



  private

  # def set_nameless_name
  #   self.name = "名前なし" if self.name.blank?
  # end

  def validate_name_not_including_comma
    # &.(ぼっち記号はnullだったときには処理をSKIPするという意味がある。)
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
