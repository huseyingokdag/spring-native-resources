build-SpringCloudFunctionLambda:
	./mvnw native:compile -Pnative
	touch ./target/bootstrap
	echo '#!/bin/sh' > ./target/bootstrap
	echo 'set -euo pipefail' >> ./target/bootstrap # Exit immediately if any command fails, propagate errors in pipelines.
	echo './cloud-function-lambda' >> ./target/bootstrap
	chmod +x ./target/bootstrap
	cp ./target/bootstrap $(ARTIFACTS_DIR)
	cp ./target/cloud-function-lambda $(ARTIFACTS_DIR)