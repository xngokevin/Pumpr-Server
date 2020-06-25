class ProfileDataSerializer < ActiveModel::Serializer
  attribute :description, if: :include_description?
  attribute :height, if: :include_height?
  attribute :weight, if: :include_weight?

  def include_description?
    true if self.object.display_description
  end

  def include_height?
    true if self.object.display_height
  end

  def include_weight?
    true if self.object.display_weight
  end
end
