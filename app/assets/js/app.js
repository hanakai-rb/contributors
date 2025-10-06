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
        window.location.href = `/${selectedOrg}`;
      } else {
        window.location.href = `/contributors`;
      }
    });
  }
});
