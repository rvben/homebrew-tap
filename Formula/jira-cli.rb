class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.21/jira-cli-v0.4.21-aarch64-apple-darwin.tar.gz"
      sha256 "ee09f3d6701d7ae0819a67bf84decb92b67976c59f90aeb65fa6783d56169fe7"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.21/jira-cli-v0.4.21-x86_64-apple-darwin.tar.gz"
      sha256 "bcbe1def23a56f48a2824f9d44df5cbccac04bf4e2e4f554d0e2b02c7a5b42ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.21/jira-cli-v0.4.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "946e49cdb8118598244bab9dd713b93a1f91c04ddad5ce9431a4098bb4cfe480"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.21/jira-cli-v0.4.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3ed369b7fd1073de7a57bd8a0ba62f3a5f1f9b78183bf12a0997a085ba78313"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
