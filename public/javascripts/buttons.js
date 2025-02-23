document.addEventListener('DOMContentLoaded', function () {
  
  const recipesButton = document.getElementById("recipesButton");
  if (recipesButton) {
    recipesButton.addEventListener('click', function () {
      window.location.href = "/recipes";
    });
  }

  const addRecipeButton = document.getElementById("addRecipeButton");
  if (addRecipeButton) {
    addRecipeButton.addEventListener('click', function () {
      window.location.href = "/addRecipe";
    });
  }
});