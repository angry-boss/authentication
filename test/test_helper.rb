require "minitest/autorun"
require 'active_record'
require 'authentication'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

# Define a minimal database schema
ActiveRecord::Schema.define do
  create_table :users do |t|
    t.string :username
  end
  
  create_table :authentication_sessions do |t|
    t.string :token, :browser_id
    t.integer :user_id
    t.boolean :active, :default => true
    t.text :data
    t.datetime :expires_at
    t.datetime :login_at
    t.string :login_ip
    t.datetime :last_activity_at
    t.string :last_activity_ip, :last_activity_path
    t.string :user_agent
    t.string :user_type
    t.integer :parent_id
    t.string :host
    t.string :token_hash
    t.integer :requests, :default => 0
    t.datetime :password_seen_at
    t.index :token_hash, :length => 10
    t.index :user_id
    t.index :browser_id, :length => 10
  
    t.timestamps :null => true
  end
end

class User < ActiveRecord::Base
  has_many :sessions, :class_name => 'Authentication::Session', :foreign_key => 'user_id', :dependent => :destroy
end

class FakeController

  def initialize(options = {})
    @options = options
  end

  def cookies
    @cookies ||= FakeCookieJar.new(@options)
  end

  def request
    @request ||= FakeRequest.new(@options)
  end

end

class FakeRequest
  def initialize(options)
    @options = options
  end

  def ip
    "127.0.0.1"
  end

  def user_agent
    "TestSuite"
  end

  def ssl?
    true
  end

  def path
    "/demo"
  end

  def host
    @options[:host] || "test.example.com"
  end
end

class FakeCookieJar
  def initialize(options = {})
    @options = options
    @raw = {}
    if @options[:browser_id]
      @raw[:browser_id] = @options[:browser_id]
    end

    if @options[:user_session]
      @raw[:user_session] = @options[:user_session]
    end
  end

  attr_reader :raw

  def [](key)
    key = @raw[key.to_sym]
    if key.is_a?(Hash)
      key[:value]
    else
      key
    end
  end

  def expiry_for(key)
    value = @raw[key.to_sym]
    if value.is_a?(Hash)
      value[:expires]
    else
      nil
    end
  end

  def []=(key, value)
    @raw[key.to_sym] = value
  end

  def delete(key)
    @raw.delete(key.to_sym)
  end
end
