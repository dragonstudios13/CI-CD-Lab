# CI/CD Lab using Jenkins

## Aim
To set up a Continuous Integration pipeline using Jenkins and automate application deployment using it.

## Tools Used
- Jenkins
- Git / GitHub
- Node.js
- Jest (testing framework)
- http-server (local deployment)

## Project Structure
```
ci-cd-jenkins-lab/
├── Jenkinsfile          # Pipeline definition (Checkout -> Install -> Test -> Deploy)
├── deploy.bat           # Windows deployment script
├── deploy.sh            # Linux/Mac deployment script
├── src/                 # Application source (calculator app)
│   ├── index.html
│   ├── style.css
│   └── calculator.js
├── tests/               # Jest test suite
│   └── calculator.test.js
├── package.json
└── README.md
```

## Setup Instructions

1. Install Java (JDK 17+), Jenkins, Git, and Node.js.
2. Unlock Jenkins at `http://localhost:8080` using the initial admin password, install suggested plugins, create an admin user.
3. Install the **NodeJS Plugin** via Manage Jenkins -> Plugins.
4. Configure a NodeJS tool named `Node20` via Manage Jenkins -> Tools.
5. Push this project to a GitHub repository.
6. In Jenkins, create a **New Item -> Pipeline** job.
   - Definition: "Pipeline script from SCM"
   - SCM: Git, point to your repo, branch `*/main`, script path `Jenkinsfile`
7. Enable **Poll SCM** (e.g. `H/1 * * * *`) or configure a GitHub webhook.
8. Click **Build Now** or push a commit to trigger the pipeline.

## Pipeline Stages
1. **Checkout** - pulls the latest code from GitHub.
2. **Install Dependencies** - runs `npm install`.
3. **Run Tests** - runs `npm test` (Jest). Pipeline stops here if any test fails.
4. **Deploy** - only runs on the `main` branch, and only if all previous stages succeeded. Serves the app locally via `http-server` on port 8081.

## Verification
- Jenkins **Stage View** shows all stages green on success.
- Visit `http://localhost:8081` to see the deployed calculator app.
- Break a test intentionally and push again to demonstrate that a failing CI stage blocks deployment.

## Conclusion
This experiment demonstrates a working CI/CD pipeline where every code change is automatically checked out, tested, and deployed only on success, eliminating manual intervention and reflecting real-world Agile/DevOps practice.

# CI-CD-Lab
