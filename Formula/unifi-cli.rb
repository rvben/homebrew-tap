class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.6/unifi-cli-v0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "361696fc1dd4f27192c58ac170a59e37089cb41c657935a07b6eb6b6deeb26b6"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.6/unifi-cli-v0.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "410dd23f0715c70266537f567aa344fd5a530c0227ba54d528e6f717f4bbe7d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.6/unifi-cli-v0.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68481697b202d46205ace6616ded804104c11b2686b4b9731e0fc7f0baf9b314"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.6/unifi-cli-v0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fe7fb55df5156dd3a3c7447b93f862bc131cebecdb4d38bb621de9275ad5717"
    end
  end

  def install
    bin.install "unifi", "unifi-cli"
    generate_completions_from_executable(bin/"unifi", "completions")
  end

  test do
    %w[unifi unifi-cli].each do |command|
      assert_match version.to_s, shell_output("#{bin}/#{command} --version")
      system "#{bin}/#{command}", "--help"
    end
  end
end
