require 'spec_helper'

describe 'nullmailer::config' do

  let :params do
    {
      'adminaddr'      => 'admin@localhost',
      'defaultdomain'  => 'localhost',
      'remotes'        => ['127.0.0.1'],
      'me'             => 'root@localhost',
    }
  end

  it { is_expected.to contain_file('/etc/nullmailer').with_ensure('directory') }

  {
    '/etc/nullmailer/me' => "root@localhost\n",
    '/etc/nullmailer/adminaddr' => "admin@localhost\n",
    '/etc/nullmailer/defaultdomain' => "localhost\n",
    '/etc/nullmailer/remotes' => "127.0.0.1\n",
    '/etc/mailname' => "localhost\n",
  }.each do |filename, content|
    it do
      is_expected.to contain_file(filename)
        .with_ensure('present')
        .with_owner('root')
        .with_group('root')
        .with_mode('0644')
        .with_content(content)
    end
  end
end
