module.exports = app => {
  const Ads = require("../controllers/ads.controller.js");
  const express = require('express');
  var router = require("express").Router();

  // Create a new Tutorial
  router.post("/addCampaign", Ads.create);

  // Retrieve all Tutorials
  router.get("/", Ads.findAll);

  // Retrieve all published Tutorials
  // router.get("/published", tutorials.findAllPublished);

  // Retrieve a single Tutorial with id
  // router.get("/:id", tutorials.findOne);

  // Update a Tutorial with id
  // router.put("/:id", tutorials.update);

  // Delete a Tutorial with id
  // router.delete("/:id", tutorials.delete);

  // Delete all Tutorials
  // router.delete("/", tutorials.deleteAll);

  app.use('/api/ads', router);
  app.use('/videos', express.static('./videos'));
};
