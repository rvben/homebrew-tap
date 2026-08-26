class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.8/jira-cli-v0.4.8-aarch64-apple-darwin.tar.gz"
      sha256 "eced4b80bcdc8a06ca317f90fe4f0f887d4e81e11b68ad510dfbe4be1db82d77"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.8/jira-cli-v0.4.8-x86_64-apple-darwin.tar.gz"
      sha256 "4fc378582d861f32039fec3839cad6e2c184680c955008f8fc56be99c93d08f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.8/jira-cli-v0.4.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "513121fd4dd0cf0655631218b642af9422e2aa43e499b6d1ce69c6ff4bc21ba5"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.8/jira-cli-v0.4.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f27296193ed0ff6ca9590fad220eae86d2b9628445b637bcc4191674493f469"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
