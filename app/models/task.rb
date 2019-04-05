class Task < ApplicationRecord
  include OmotenashiMobule

  # Action Storageを利用する準備ができたので、画像ファイルを添付できるようにします。
  # 1つのタスクに1つの画像が紐づけます。また画像は:imageで呼ぶことができるようになります。
  has_one_attached :image


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
