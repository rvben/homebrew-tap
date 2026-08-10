class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.0/jira-cli-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "cb7ba12fbc3f1a683a10e64bfcf8e986f37eff4b09b87cc164bb053e4df14705"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.0/jira-cli-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "2555706efb477a134411617421c49e16904879a7581da47547c8924c12855aba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.0/jira-cli-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2dc26eecdfa4844cf975c3ac08410c57b6c178ad654cb95bbf0ba87e7b07b02"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.0/jira-cli-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "620c37d35656f1ac3cdc7ff387c26160e7c3468f4cf9ae237421cd1fe550aebb"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
