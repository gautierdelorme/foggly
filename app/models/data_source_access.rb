class DataSourceAccess < ApplicationRecord
  belongs_to :data_source
  belongs_to :user_group

  validates :data_source, :user_group, presence: true
end
