class Openarchieven < Formula
  desc "Command-line interface to the openarchieven.nl Dutch genealogical API"
  homepage "https://github.com/rvben/openarchieven-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.3.0/openarchieven-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "27ab634812ef5016af07a42e2728fcb36d96b86d3e6f00465a9ea0ff104f7979"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.3.0/openarchieven-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "e3c0fb7d093402b28302157e2330e8fcc785948fc8fb1036397ca5f3fe6a1100"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.3.0/openarchieven-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5676f769a919fee837d41ba2a54ee039b9862651ad347131efab7d13f334297"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.3.0/openarchieven-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2793d01c9e985cd5bfab3d63564a85f4f65faba92c5f8593839c34be230d842c"
    end
  end

  def install
    bin.install "openarchieven"
  end

  test do
    system "#{bin}/openarchieven", "version"
  end
end
