# frozen_string_literal: true

require 'spec_helper'

describe 'netplan' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      it do
        is_expected.to contain_class('netplan::install').with(
          'manage_package' => true,
          'package_ensure' => 'installed',
        )
      end

      it do
        is_expected.to contain_class('netplan::config').with(
          'dir_purge' => false,
        )
      end

      it do
        is_expected.to contain_exec('netplan apply').with(
          'command' => '/usr/sbin/netplan apply',
          'refreshonly' => true,
        )
      end

      context 'with manage_package => true' do
        let(:params) do
          {
            'manage_package' => true
          }
        end

        it do
          is_expected.to contain_class('netplan::install').with(
            'manage_package' => true,
            'package_ensure' => 'installed',
          )
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
            is_expected.to contain_class('netplan::install').with(
              'manage_package' => true,
              'package_ensure' => 'installed',
            )
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
            is_expected.to contain_class('netplan::install').with(
              'manage_package' => true,
              'package_ensure' => 'absent',
            )
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
          is_expected.to contain_class('netplan::install').with(
            'manage_package' => false,
            'package_ensure' => 'installed',
          )
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
            is_expected.to contain_class('netplan::install').with(
              'manage_package' => false,
              'package_ensure' => 'installed',
            )
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
            is_expected.to contain_class('netplan::install').with(
              'manage_package' => false,
              'package_ensure' => 'absent',
            )
          end
        end
      end

      context 'with netplan_dir_purge => true' do
        let(:params) do
          {
            'netplan_dir_purge' => true
          }
        end

        it do
          is_expected.to contain_class('netplan::config').with(
            'dir_purge' => true,
          )
        end
      end

      context 'with netplan_dir_purge => true' do
        let(:params) do
          {
            'netplan_dir_purge' => false
          }
        end

        it do
          is_expected.to contain_class('netplan::config').with(
            'dir_purge' => false,
          )
        end
      end
    end

    context 'unsupported operating system' do
      describe 'netplan class without any parameters' do
        let(:facts) do
          {
            osfamily: 'SOFriki',
            operatingsystem: 'SOFregit',
          }
        end

        it {
          expect { is_expected.to raise_error(Puppet::Error) }
        }
      end
    end
  end
end
