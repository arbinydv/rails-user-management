class ContentSerializer < ActiveModel::Serializer
  attribute :id
  attribute :type
  attribute :attributes do
    {
      title: object.title,
      body: object.body,
      createdAt: object.created_at.iso8601,
      updatedAt: object.updated_at.iso8601
    }
  end

  def type
    'content'
  end 
end
