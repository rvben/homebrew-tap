class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.3.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.13/jira-cli-v0.3.13-aarch64-apple-darwin.tar.gz"
      sha256 "5114dc8a00bdf02810a8cf96db8c6becce7f7c3c93f9a3b6b5b34e882da23047"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.13/jira-cli-v0.3.13-x86_64-apple-darwin.tar.gz"
      sha256 "97d15735db33e76a505420cd0ffea40ce5e8b684d7d1a661458df1ce84007582"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.13/jira-cli-v0.3.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1cc4d7dc003def889a76da2fdb0de62a50297a8ec178d2ecd4d0b68391ec1aa7"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.13/jira-cli-v0.3.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ced609552ba98b9dec589b2b0911cde6f90b3883728e4452c08bf799941c10a7"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
