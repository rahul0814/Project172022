const Ads = require("../models/ads.model.js");

// Create and Save a new Tutorial
exports.create = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
  }


  const tutorial = new Ads({
    client_id: req.body.client_id,
    video_id: req.body.video_id,
    product_id: req.body.product_id,
    business: req.body.business,
    Imp: req.body.Imp,
    name: req.body.name,
    url: req.body.url,
    startDate: req.body.startDate,
    endDate: req.body.endDate,
    click: req.body.click,
  });

  // Save Tutorial in the database
  Ads.create(tutorial, (err, data) => {
    console.log("sasas", tutorial);
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while creating the Ads.",
      });
    else res.send(data);
  });
};

// Retrieve all Tutorials from the database (with condition).
exports.findAll = (req, res) => {
  const title = req.query.title;

  Ads.getAll(title, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving tutorials.",
      });
    else res.send(data);
  });
};

// Find a single Tutorial by Id
exports.findOne = (req, res) => {
  Ads.findById(req.params.id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Tutorial with id ${req.params.id}.`,
        });
      } else {
        res.status(500).send({
          message: "Error retrieving Tutorial with id " + req.params.id,
        });
      }
    } else res.send(data);
  });
};

// find all published Tutorials
exports.findAllPublished = (req, res) => {
  Ads.getAllPublished((err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving tutorials.",
      });
    else res.send(data);
  });
};

// Update a Tutorial identified by the id in the request
exports.update = (req, res) => {
  // Validate Request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
  }



  Ads.updateById(req.params.id, new Tutorial(req.body), (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Tutorial with id ${req.params.id}.`,
        });
      } else {
        res.status(500).send({
          message: "Error updating Tutorial with id " + req.params.id,
        });
      }
    } else res.send(data);
  });
};

// Delete a Tutorial with the specified id in the request
exports.delete = (req, res) => {
  Ads.remove(req.params.id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Tutorial with id ${req.params.id}.`,
        });
      } else {
        res.status(500).send({
          message: "Could not delete Tutorial with id " + req.params.id,
        });
      }
    } else res.send({ message: `Tutorial was deleted successfully!` });
  });
};

// Delete all Tutorials from the database.
exports.deleteAll = (req, res) => {
  Ads.removeAll((err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while removing all tutorials.",
      });
    else res.send({ message: `All Tutorials were deleted successfully!` });
  });
};
