class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.15/jira-cli-v0.4.15-aarch64-apple-darwin.tar.gz"
      sha256 "d07efc673765709316c63f6dc5a1c95a20fa10473ed67a0e04927bc33cc3221a"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.15/jira-cli-v0.4.15-x86_64-apple-darwin.tar.gz"
      sha256 "39c6b4f51fe722469d78cfc12c8ba3dfe3090a9e315b56c5e5de0a4f94ec87a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.15/jira-cli-v0.4.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12f175966cf4da3108a225920686b5ba10dec38a1fd0b6c535e6e36d74e60beb"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.15/jira-cli-v0.4.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "347ee529107eff607136d962f5c3586a3ffd2c7ea6d1513efaf8188bc50c0132"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
