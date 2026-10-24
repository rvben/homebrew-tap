class SharepointCli < Formula
  desc "Manage SharePoint sites, libraries, and files"
  homepage "https://github.com/rvben/sharepoint-cli"
  version "0.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.0.12/sharepoint-v0.0.12-aarch64-apple-darwin.tar.gz"
      sha256 "e6bbe1152dcf86784cf0925dd726fc20677fdd9eb63790c8d2654a3720ef74dc"
    else
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.0.12/sharepoint-v0.0.12-x86_64-apple-darwin.tar.gz"
      sha256 "0ab5f7d0865ea7b0470cfcec02d0d2cedc3126fe48de7958fd28709fd2cdf8eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.0.12/sharepoint-v0.0.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d936e0d98dfee788ac462ef78701cbba88d1be56e57503eaa5960a6f419edc09"
    else
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.0.12/sharepoint-v0.0.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "892c423e394280958a86a6aed4ca223f3eec8d4158621c5e5179804782a858a9"
    end
  end

  def install
    bin.install "sharepoint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sharepoint --version")
    assert_match "Usage:", shell_output("#{bin}/sharepoint --help")
  end
end
