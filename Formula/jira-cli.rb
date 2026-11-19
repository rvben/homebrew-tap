class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.22/jira-cli-v0.4.22-aarch64-apple-darwin.tar.gz"
      sha256 "538f1afcc9770206db285d32dcf19d42da05a0dfad93909b98d7d402c0738864"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.22/jira-cli-v0.4.22-x86_64-apple-darwin.tar.gz"
      sha256 "5d1e2f0d6293dd4420d1cd9f72b05151be6ec40ba717b0e3bbb5340667f1e4ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.22/jira-cli-v0.4.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "280677fdd19804eb5a923d5b703f549a835867a44f0198e9b9b98e0c08881c43"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.22/jira-cli-v0.4.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e482c4804d3ec203579805ee60209013785ccf7aa2e2650f0d9712550f5e0e91"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
