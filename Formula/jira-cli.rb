class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.9/jira-cli-v0.4.9-aarch64-apple-darwin.tar.gz"
      sha256 "a6eceea7a31c7f397ce8c252b3b46be410e195d543c143032a0ca7b4309fc8cd"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.9/jira-cli-v0.4.9-x86_64-apple-darwin.tar.gz"
      sha256 "ff8dda29eb3b8325c507664134af111a75d0290e0b29fb2188ea8ff8bd1566d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.9/jira-cli-v0.4.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "118d2c2667b7f7acf215f9d04b18d8996d2bff57e16af745bc933647a66ada13"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.9/jira-cli-v0.4.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70983838d0459f880f1f962d6325395fd40e2459093823e78afbe5ca8fe307ca"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
