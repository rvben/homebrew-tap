class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.0/unifi-cli-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "b4e6968f8bb1b53c012efab847d82cedc9b114555114b1731e5ea6e066c2b8f3"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.0/unifi-cli-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "741bf60b488e71f817d60ab87dc9db0d1904bf99512c92f4661fa1982280d068"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.0/unifi-cli-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b1605999f9db6f46e2cc13a1e7a89432340dd51013608d6283112780709b601"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.0/unifi-cli-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a4486efe7bfda8d3e72bd59c145a4f5a0108c79feb55fd5cb17c7168c9efdce"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
