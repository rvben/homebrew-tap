class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.1/jira-cli-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "e889a42d6b3308ccf15a587a8b66c3b3093194d5dca7abfa551eeee585d05c56"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.1/jira-cli-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "c9386c7f799296b7796b8b334b4cd9cc0492d0648a984fa4c03722bbb93a8c81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.1/jira-cli-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2cea7504362cb5a9c7cb56ea5992d7c197c0e1f28fa551c76203a2d7fe3fbe1"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.1/jira-cli-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e9816cb13b4e3483b7242f67227106febe911449c702c14df1b0b3e7ac4bf8c4"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
