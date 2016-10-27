require 'spec_helper'
describe 'apt_auto_pin' do
  context 'with default values for all parameters' do
    it { should contain_class('apt_auto_pin') }
  end
end
