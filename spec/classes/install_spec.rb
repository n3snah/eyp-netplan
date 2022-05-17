# frozen_string_literal: true

require 'spec_helper'

describe 'netplan::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_package('netplan.io').with_ensure('installed')
      end

      context 'with manage_package => true' do
        let(:params) do
          {
            'manage_package' => true
          }
        end

        it do
          is_expected.to contain_package('netplan.io').with_ensure('installed')
        end

        context 'with package_ensure => installed' do
          let(:params) do
            super().merge(
              {
                'package_ensure' => 'installed'
              },
            )
          end

          it do
            is_expected.to contain_package('netplan.io').with_ensure('installed')
          end
        end

        context 'with package_ensure => absent' do
          let(:params) do
            super().merge(
              {
                'package_ensure' => 'absent'
              },
            )
          end

          it do
            is_expected.to contain_package('netplan.io').with_ensure('absent')
          end
        end
      end

      context 'with manage_package => false' do
        let(:params) do
          {
            'manage_package' => false
          }
        end

        it do
          is_expected.not_to contain_package('netplan.io')
        end

        it do
          is_expected.to have_resource_count(0)
        end
      end
    end
  end
end
