class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.8/jira-cli-v0.3.8-aarch64-apple-darwin.tar.gz"
      sha256 "2b7d1149cbe8a0e38665cc2f820fda188ffc7819aea0aadd441176c861c97886"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.8/jira-cli-v0.3.8-x86_64-apple-darwin.tar.gz"
      sha256 "f1c5c59d2e4403f54b7b7501593ea19483a8600fc92c2ac2c98298b62f4b7956"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.8/jira-cli-v0.3.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1ee5629c83d8c5b7e655ab4672b5d4c9a6dbeb85108e09df8951bbd5e727fee"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.8/jira-cli-v0.3.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6cd6cac29042f6e45ebffc431b4514c3ee491efd5fa4477e012ff5f5a3d6a2a9"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
