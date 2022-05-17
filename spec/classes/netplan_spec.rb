# frozen_string_literal: true

require 'spec_helper'

describe 'netplan' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      it do
        is_expected.to contain_class('netplan::install')
      end

      it do
        is_expected.to contain_class('netplan::config')
      end

      it do
        is_expected.to contain_exec('netplan apply').with(
          'command' => '/usr/sbin/netplan apply',
          'refreshonly' => true,
        )
      end
    end
  end
end
