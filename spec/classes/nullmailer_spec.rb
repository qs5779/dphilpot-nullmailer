# spec/classes/init_spec.rb
require 'spec_helper'

describe 'nullmailer', :type => :class do

  let(:params) {{
    :adminaddr      => 'root@localhost',
    :defaultdomain  => 'localhost',
    :remotes        => ['127.0.0.1',],
    :me             => 'root@localhost',
    :package_ensure => 'latest',
    :package_name   => 'nullmailer',
  }}

  it { should contain_class('nullmailer::install') }
  it { should contain_class('nullmailer::config') }
  it { should contain_class('nullmailer::service') }

  describe "Nullmailer class" do
    describe "with default parameters" do
      describe 'nullmailer::install', :type => :class do
          it { should contain_package('nullmailer') }
      end

      describe 'nullmailer::config', :type => :class do
          it { should contain_file('/etc/nullmailer').with( 'ensure' => 'directory', ) }
          it { should contain_file(
                '/etc/nullmailer/me',
                '/etc/nullmailer/adminaddr',
                '/etc/nullmailer/defaultdomain',
                '/etc/nullmailer/remotes',
                '/etc/mailname'
              ).with(
                'ensure' => 'present',
                'owner'  => 'root',
                'group'  => 'root',
                'mode'   => '0644',
              )
          }
      end

      describe 'nullmailer::service', :type => :class do
          it { should contain_service('nullmailer').with( 'ensure' => 'running', 'hasrestart' => 'true', ) }
      end
    end
  end
end
