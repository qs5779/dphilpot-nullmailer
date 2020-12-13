require 'spec_helper'

describe 'nullmailer::install' do
  on_supported_os.each do |_os, _facts|
    let :params do
      {
        'package_ensure' => 'installed',
        'package_name'   => 'nullmailer',
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_package('nullmailer').with_name('nullmailer').with_ensure('installed') }
  end
end
