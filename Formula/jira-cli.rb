class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.11/jira-cli-v0.4.11-aarch64-apple-darwin.tar.gz"
      sha256 "4d47624844d955e7d33e25a7eed2f3fd92cd23dacbaaeed6d418e1ee5c82f942"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.11/jira-cli-v0.4.11-x86_64-apple-darwin.tar.gz"
      sha256 "532537dde20a2b48bef6e1dc472413b34ce8569a522d84ca36092db82111e962"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.11/jira-cli-v0.4.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "353419482d78f5e26d6ad16067e2aa6f9d9f0b1b9b659d84c0b339dfbc9d4f3d"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.11/jira-cli-v0.4.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e05acfa10f941435ba2d52bc5ad089edcf342b49125a837efc12e6c1666c1662"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
