class CreateRepos < ActiveRecord::Migration
  def self.up
    create_table :repos, :force => true do |t|
      %w(name description url language integrate_branch homepage source).each do |attr|
        t.string attr
      end
      
      %w(owner parent).each do |attr|
        t.references attr
      end
      
      # TODO: organization temporarily a string, only when there's no organization model
      %w(size followers_count forks_count score organization_id forks watchers).each do |attr|
        t.integer attr
      end
      
      %w(has_downloads fork deleted locked has_wiki private open_issues has_issues).each do |attr|
        t.boolean attr
      end
      
      %w(created_at pushed_at).each do |attr|
        t.datetime attr
      end
    end
  end
  
  def self.down
    drop_table :repos
  end
end