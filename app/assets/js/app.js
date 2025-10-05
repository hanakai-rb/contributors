import "../css/app.css";

// Function to add navigation from the Select dropdown to add Org into the params
// account for when the param is empty value 'all' should go to /contributors
// otherwise /contributors/:org
// on page load set the select value to the current org from the URL if present
document.addEventListener("DOMContentLoaded", () => {
  const orgSelect = document.getElementById("org-select");
  if (orgSelect) {
    orgSelect.addEventListener("change", (event) => {
      const selectedOrg = event.target.value;
      if (selectedOrg) {
        window.location.href = `/contributors/${selectedOrg}`;
      } else {
        window.location.href = `/contributors`;
      }
    });

    // On page load, set the select value to the current org from the URL if present
    const pathParts = window.location.pathname.split("/");
    if (pathParts.length === 3 && pathParts[1] === "contributors") {
      const currentOrg = pathParts[2];
      orgSelect.value = currentOrg;
    } else {
      orgSelect.value = ""; // Default to 'all' if no org in URL
    }
  }
});
