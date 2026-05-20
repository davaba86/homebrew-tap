class Agentfiles < Formula
  desc "Standardize AI coding-agent instruction files across repositories"
  homepage "https://github.com/davaba86/agentfiles"
  license "MIT"
  head "https://github.com/davaba86/agentfiles.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/agentfiles"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentfiles version")
  end
end
