class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.24/jira-cli-v0.4.24-aarch64-apple-darwin.tar.gz"
      sha256 "5815f50c0228d2e3e0b59d4b568740eae2ec204292d273879b74c6cafbb186d5"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.24/jira-cli-v0.4.24-x86_64-apple-darwin.tar.gz"
      sha256 "acfe151f44916c12a73e774e74c11f2dad43db2c9ba32748c6a30014ff67d34c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.24/jira-cli-v0.4.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01ebcf6c44a1c40b3fbc438dd7ba69fcdb2939b7403d8690ad9ed734b37eca61"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.24/jira-cli-v0.4.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78ccb76c078b76ff91498ff96ad93337bf2ad9c8df0fecc3c36e87c4c0fd7e0a"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
