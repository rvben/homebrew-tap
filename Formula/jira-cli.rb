class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.19/jira-cli-v0.4.19-aarch64-apple-darwin.tar.gz"
      sha256 "f969d9f2711b76f7a97a5769d37f57f1cba40189bf6733c62e572cd7b3fc62db"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.19/jira-cli-v0.4.19-x86_64-apple-darwin.tar.gz"
      sha256 "a1c3ee224415a9573f37497ee33749bfb5650e86985432a1f1b41f871adc0e1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.19/jira-cli-v0.4.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ebfdfea28e25d2c68445d00ad832c5836d2a19f21e49e92863fa38b878875b2"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.19/jira-cli-v0.4.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52e30942540adecf0ac1cc68af11d1bbb2580f3c4baeb18afe3482508d607a31"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
