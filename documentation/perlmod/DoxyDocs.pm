$doxydocs=
{
  classes => [
    {
      name => 'Ball',
      kind => 'struct',
      inner => [
      ],
      includes => {
        local => 'no',
        name => 'Runner.h'
      },
      all_members => [
        {
          name => 'Ball',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Ball'
        },
        {
          name => 'in',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Ball'
        },
        {
          name => 'operator[]',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Ball'
        },
        {
          name => 'points_in',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Ball'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'in',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Decider for if the ID\'s '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' is in this '
                },
                {
                  type => 'url',
                  link => 'struct_ball',
                  content => 'Ball'
                },
                {
                  type => 'text',
                  content => '. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'target'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The ID of the node being checked if within this ball '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'true '
                    },
                    {
                      type => 'url',
                      link => 'struct_node',
                      content => 'Node'
                    },
                    {
                      type => 'text',
                      content => ' is in the '
                    },
                    {
                      type => 'url',
                      link => 'struct_ball',
                      content => 'Ball'
                    },
                    {
                      type => 'text',
                      content => ' '
                    },
                    {
                      type => 'parbreak'
                    },
                    {
                      type => 'text',
                      content => 'false '
                    },
                    {
                      type => 'url',
                      link => 'struct_node',
                      content => 'Node'
                    },
                    {
                      type => 'text',
                      content => ' is NOT in the ball '
                    }
                  ]
                }
              ]
            },
            type => 'bool',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'target',
                type => 'const id_t &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'Ball',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Construct a new '
                },
                {
                  type => 'url',
                  link => 'struct_ball',
                  content => 'Ball'
                },
                {
                  type => 'text',
                  content => ' object. '
                }
              ]
            },
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'operator[]',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => '[] Operator to access the distance hashmap directly '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'new_id'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The ID of the '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' being added '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'dist_t& The distance from the center node to the ID given '
                    }
                  ]
                }
              ]
            },
            type => 'dist_t &',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'new_id',
                type => 'const id_t &'
              }
            ]
          }
        ]
      },
      public_members => {
        members => [
          {
            kind => 'variable',
            name => 'points_in',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'A hashmap with KEY: ID and VALUE: Distance for the center node to the ID\'s node '
                }
              ]
            },
            type => 'unordered_map< id_t, dist_t >'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Struct to represent the \''
          },
          {
            type => 'url',
            link => 'struct_ball',
            content => 'Ball'
          },
          {
            type => 'text',
            content => '\' around the node (aka the distances) '
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'Edge',
      kind => 'struct',
      inner => [
      ],
      includes => {
        local => 'no',
        name => 'Runner.h'
      },
      all_members => [
        {
          name => 'Edge',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Edge'
        },
        {
          name => 'from',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Edge'
        },
        {
          name => 'to',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Edge'
        },
        {
          name => 'weight',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Edge'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'Edge',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'from',
                type => 'const int &'
              },
              {
                declaration_name => 'to',
                type => 'const int &'
              },
              {
                declaration_name => 'weight',
                type => 'const double &'
              }
            ]
          }
        ]
      },
      public_members => {
        members => [
          {
            kind => 'variable',
            name => 'from',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'ID of the start node of the edge '
                }
              ]
            },
            type => 'id_t'
          },
          {
            kind => 'variable',
            name => 'to',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'ID of the destination of the edge '
                }
              ]
            },
            type => 'id_t'
          },
          {
            kind => 'variable',
            name => 'weight',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Weight of the edge to traverse (set to 1 for unweighted) '
                }
              ]
            },
            type => 'double'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Struct to represent Edges and from which node to which and the weight to take the edge. '
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'Node',
      kind => 'struct',
      inner => [
      ],
      includes => {
        local => 'no',
        name => 'Runner.h'
      },
      all_members => [
        {
          name => 'id',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        },
        {
          name => 'Node',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        },
        {
          name => 'operator!=',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        },
        {
          name => 'operator!=',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        },
        {
          name => 'operator==',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        },
        {
          name => 'operator==',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        },
        {
          name => 'sample',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        },
        {
          name => 'state',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        },
        {
          name => 'x',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        },
        {
          name => 'y',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Node'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'Node',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Construct a new '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' object. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'id'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The ID of the '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'x'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'The x coord of the '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'The y coord of the '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' '
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'id',
                type => 'const int &',
                default_value => '-1'
              },
              {
                declaration_name => 'x',
                type => 'const int &',
                default_value => '0'
              },
              {
                declaration_name => 'y',
                type => 'const int &',
                default_value => '0'
              }
            ]
          },
          {
            kind => 'function',
            name => 'operator==',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Equivalency operator for two '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' objects. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'other'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The other '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' being compared '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'true The same '
                    },
                    {
                      type => 'url',
                      link => 'struct_node',
                      content => 'Node'
                    },
                    {
                      type => 'text',
                      content => ' (given by ID) '
                    },
                    {
                      type => 'parbreak'
                    },
                    {
                      type => 'text',
                      content => 'false Different Nodes '
                    }
                  ]
                }
              ]
            },
            type => 'bool',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'other',
                type => 'const Node &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'operator==',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Equivalency operator for a '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' object and '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' pointer. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'other'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The other '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' being compared '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'true The same '
                    },
                    {
                      type => 'url',
                      link => 'struct_node',
                      content => 'Node'
                    },
                    {
                      type => 'text',
                      content => ' (given by ID) '
                    },
                    {
                      type => 'parbreak'
                    },
                    {
                      type => 'text',
                      content => 'false Different Nodes '
                    }
                  ]
                }
              ]
            },
            type => 'bool',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'other',
                type => 'const Node *'
              }
            ]
          },
          {
            kind => 'function',
            name => 'operator!=',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Non-Equivalency operator for two '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' objects. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'other'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The other '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' being compared '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'true Different Nodes (given by ID) '
                    },
                    {
                      type => 'parbreak'
                    },
                    {
                      type => 'text',
                      content => 'false Same Nodes '
                    }
                  ]
                }
              ]
            },
            type => 'bool',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'other',
                type => 'const Node &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'operator!=',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Non-Equivalency operator for a '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' object and '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' pointer. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'other'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The other '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' being compared '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'true Different Nodes (given by ID) '
                    },
                    {
                      type => 'parbreak'
                    },
                    {
                      type => 'text',
                      content => 'false Same Nodes '
                    }
                  ]
                }
              ]
            },
            type => 'bool',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'other',
                type => 'const Node *'
              }
            ]
          }
        ]
      },
      public_members => {
        members => [
          {
            kind => 'variable',
            name => 'id',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The ID of the node (-1 if not set) '
                }
              ]
            },
            type => 'id_t',
            initializer => '= -1'
          },
          {
            kind => 'variable',
            name => 'x',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The x coord of the node '
                }
              ]
            },
            type => 'int',
            initializer => '= 0'
          },
          {
            kind => 'variable',
            name => 'y',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The y coord of the node '
                }
              ]
            },
            type => 'int',
            initializer => '= 0'
          },
          {
            kind => 'variable',
            name => 'sample',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Which sample the node is in (only for graphics) '
                }
              ]
            },
            type => 'int',
            initializer => '= 0'
          },
          {
            kind => 'variable',
            name => 'state',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Which state of display the node is (is a sample, selected, ect) (only for graphics) '
                }
              ]
            },
            type => 'PointState',
            initializer => '= PointState::BLANK'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Struct to hold the coordinates of the Graphical representation of a '
          },
          {
            type => 'url',
            link => 'struct_node',
            content => 'Node'
          },
          {
            type => 'text',
            content => '. '
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'Runner',
      kind => 'class',
      inner => [
      ],
      includes => {
        local => 'no',
        name => 'Runner.h'
      },
      all_members => [
        {
          name => 'A',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'additional_edges',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'adjacency_matrix',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'balls',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'calcDistance',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'clock',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'closest',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'controller',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'controller_used',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'dist_k',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'dist_path',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'drawBlackLine',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'drawBlueLine',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'drawFrame',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'drawGreenLine',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'drawGreyLine',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'drawYellowLine',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'edges',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'font1',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'getClosest',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'inBall',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'initApp',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'initGraph',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'initSDL',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'k',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'm',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'n',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'num_nodes',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'p_i',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'point_sprites',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'prepro',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'printLevels',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'prob',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'query_u',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'query_v',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'renderer',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'reset',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'resetFrame',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'run',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'Runner',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'running',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'screen',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'shutdownApp',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'space',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'stored_distance',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'stretch',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'updateClosest',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'updateScreen',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'userInput',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        },
        {
          name => 'V',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'view',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => 'window',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Runner'
        },
        {
          name => '~Runner',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Runner'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'Runner',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Construct a the graphics for rendering, the Graph, and the Balls. '
                }
              ]
            },
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'num_nodes',
                type => 'const int &'
              },
              {
                declaration_name => 'k',
                type => 'const int &'
              },
              {
                declaration_name => 'additional_edges',
                type => 'const int &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'run',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Main handler for the running of the simulator\'s graphics. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'int The exit state of the program '
                    }
                  ]
                }
              ]
            },
            type => 'int',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'prepro',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Handler for preprocesing the oracles. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => '! Algorithm Attributes !  '
                }
              ]
            },
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'dist_k',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Query Algorithm for getting the approximate distance from two Nodes. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'u'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The starting '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'v'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'The destination '
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'dist_t The approx distance between Nodes u and v '
                    }
                  ]
                }
              ]
            },
            type => 'dist_t',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'u',
                type => 'id_t'
              },
              {
                declaration_name => 'v',
                type => 'id_t'
              }
            ]
          },
          {
            kind => 'function',
            name => 'inBall',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Method that returns the sample number of the ball the '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' is in. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'center'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The center node, whose Balls will be checked (hehe) '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'target'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'The node trying to be found in '
                        },
                        {
                          type => 'style',
                          style => 'code',
                          enable => 'yes'
                        },
                        {
                          type => 'text',
                          content => 'center'
                        },
                        {
                          type => 'style',
                          style => 'code',
                          enable => 'no'
                        },
                        {
                          type => 'text',
                          content => '\'s balls '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'int The sample (or '
                    },
                    {
                      type => 'url',
                      link => 'struct_ball',
                      content => 'Ball'
                    },
                    {
                      type => 'text',
                      content => ' level) of '
                    },
                    {
                      type => 'style',
                      style => 'code',
                      enable => 'yes'
                    },
                    {
                      type => 'text',
                      content => 'center'
                    },
                    {
                      type => 'style',
                      style => 'code',
                      enable => 'no'
                    },
                    {
                      type => 'text',
                      content => ' the '
                    },
                    {
                      type => 'style',
                      style => 'code',
                      enable => 'yes'
                    },
                    {
                      type => 'text',
                      content => 'target'
                    },
                    {
                      type => 'style',
                      style => 'code',
                      enable => 'no'
                    },
                    {
                      type => 'text',
                      content => ' is in (-1 if not found) '
                    }
                  ]
                }
              ]
            },
            type => 'int',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'center',
                type => 'const id_t &'
              },
              {
                declaration_name => 'target',
                type => 'const id_t &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'initGraph',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Init obj\'s. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Initializes the graph given a certain seed '
                }
              ]
            },
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'userInput',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'User Input. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Handlr for user input '
                }
              ]
            },
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getClosest',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Get the closest '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' to the given x and y coords. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'x'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'The x coord of the query point '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'The y coord of the query point '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'Node* The closet '
                    },
                    {
                      type => 'url',
                      link => 'struct_node',
                      content => 'Node'
                    },
                    {
                      type => 'text',
                      content => ' to the given coordinate '
                    }
                  ]
                }
              ]
            },
            type => 'Node *',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'x',
                type => 'const int &'
              },
              {
                declaration_name => 'y',
                type => 'const int &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'updateClosest',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Handler for updating the closest '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => '. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'Node* The new closest '
                    },
                    {
                      type => 'url',
                      link => 'struct_node',
                      content => 'Node'
                    },
                    {
                      type => 'text',
                      content => ' to user\'s cursor '
                    }
                  ]
                }
              ]
            },
            type => 'Node *',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => '~Runner',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Destroy the '
                },
                {
                  type => 'url',
                  link => 'class_runner',
                  content => 'Runner'
                },
                {
                  type => 'text',
                  content => ' object and free the memory of all balls and points. '
                }
              ]
            },
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'reset',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Reset the simulation by freeing memory. '
                }
              ]
            },
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'resetFrame',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Method to reset the current frame to blank to redraw onto. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => '! Statistics Attributes !  '
                }
              ]
            },
            type => 'void',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'drawFrame',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Method to draw the points and edges onto the screen. '
                }
              ]
            },
            detailed => {},
            type => 'void',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'drawBlackLine',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Draws a BLACK line from the two given coordinates. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'x1'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'First x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y1'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'First y coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'x2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second y coord '
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            type => 'void',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'x1',
                type => 'const int &'
              },
              {
                declaration_name => 'y1',
                type => 'const int &'
              },
              {
                declaration_name => 'x2',
                type => 'const int &'
              },
              {
                declaration_name => 'y2',
                type => 'const int &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawBlueLine',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Draws a BLUE line from the two given coordinates. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'x1'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'First x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y1'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'First y coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'x2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second y coord '
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            type => 'void',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'x1',
                type => 'const int &'
              },
              {
                declaration_name => 'y1',
                type => 'const int &'
              },
              {
                declaration_name => 'x2',
                type => 'const int &'
              },
              {
                declaration_name => 'y2',
                type => 'const int &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawYellowLine',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Draws a YELLOW line from the two given coordinates. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'x1'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'First x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y1'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'First y coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'x2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second y coord '
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            type => 'void',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'x1',
                type => 'const int &'
              },
              {
                declaration_name => 'y1',
                type => 'const int &'
              },
              {
                declaration_name => 'x2',
                type => 'const int &'
              },
              {
                declaration_name => 'y2',
                type => 'const int &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawGreenLine',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Draws a GREEN line from the two given coordinates. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'x1'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'First x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y1'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'First y coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'x2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second y coord '
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            type => 'void',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'x1',
                type => 'const int &'
              },
              {
                declaration_name => 'y1',
                type => 'const int &'
              },
              {
                declaration_name => 'x2',
                type => 'const int &'
              },
              {
                declaration_name => 'y2',
                type => 'const int &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawGreyLine',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Draws a GREY line from the two given coordinates. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'x1'
                        }
                      ],
                      doc => [
                        {
                          type => 'text',
                          content => 'First x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y1'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'First y coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'x2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second x coord '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'y2'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'text',
                          content => 'Second y coord '
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            type => 'void',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'x1',
                type => 'const int &'
              },
              {
                declaration_name => 'y1',
                type => 'const int &'
              },
              {
                declaration_name => 'x2',
                type => 'const int &'
              },
              {
                declaration_name => 'y2',
                type => 'const int &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'initSDL',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Init the SDL tools. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'true Succesfully init '
                    },
                    {
                      type => 'parbreak'
                    },
                    {
                      type => 'text',
                      content => 'false Failed to init '
                    }
                  ]
                }
              ]
            },
            type => 'bool',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'initApp',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Init the '
                },
                {
                  type => 'url',
                  link => 'struct_screen',
                  content => 'Screen'
                },
                {
                  type => 'text',
                  content => ' App. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'true Succesfully init '
                    },
                    {
                      type => 'parbreak'
                    },
                    {
                      type => 'text',
                      content => 'false Failed to init '
                    }
                  ]
                }
              ]
            },
            type => 'bool',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'shutdownApp',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Shutdown the app and free allocated SDL memory. '
                }
              ]
            },
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'updateScreen',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Update the window size. '
                }
              ]
            },
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'printLevels',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Testing method to print the nodes in each sample. '
                }
              ]
            },
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'calcDistance',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Calculate the Euclidian distance between two nodes. '
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  params => [
                    {
                      parameters => [
                        {
                          name => 'a'
                        }
                      ],
                      doc => [
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' a '
                        }
                      ]
                    },
                    {
                      parameters => [
                        {
                          name => 'b'
                        }
                      ],
                      doc => [
                        {
                          type => 'parbreak'
                        },
                        {
                          type => 'url',
                          link => 'struct_node',
                          content => 'Node'
                        },
                        {
                          type => 'text',
                          content => ' b '
                        }
                      ]
                    }
                  ]
                },
                {
                  return => [
                    {
                      type => 'text',
                      content => 'double The Euclidian distance between the two nodes '
                    }
                  ]
                }
              ]
            },
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'a',
                type => 'const Node &'
              },
              {
                declaration_name => 'b',
                type => 'const Node &'
              }
            ]
          }
        ]
      },
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'controller',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => '! Graphic Attributes ! Would be for using a controller to control but... '
                }
              ]
            },
            type => 'SDL_GameController *'
          },
          {
            kind => 'variable',
            name => 'window',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The SDL Window to render onto '
                }
              ]
            },
            type => 'SDL_Window *'
          },
          {
            kind => 'variable',
            name => 'renderer',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The SDL Renderer to draw things onto the windor '
                }
              ]
            },
            type => 'SDL_Renderer *'
          },
          {
            kind => 'variable',
            name => 'point_sprites',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The loaded spritesheet of the point sprites '
                }
              ]
            },
            type => 'Spritesheet'
          },
          {
            kind => 'variable',
            name => 'font1',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The font for text '
                }
              ]
            },
            type => 'FC_Font *'
          },
          {
            kind => 'variable',
            name => 'screen',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The '
                },
                {
                  type => 'url',
                  link => 'struct_screen',
                  content => 'Screen'
                },
                {
                  type => 'text',
                  content => ' object to create the window '
                }
              ]
            },
            type => 'Screen'
          },
          {
            kind => 'variable',
            name => 'clock',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The clock for the current tick the screen is being drawn on '
                }
              ]
            },
            type => 'tick_t',
            initializer => '=0'
          },
          {
            kind => 'variable',
            name => 'query_v',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Pointer to the node being used as the starting point '
                }
              ]
            },
            type => 'Node *',
            initializer => '=nullptr'
          },
          {
            kind => 'variable',
            name => 'query_u',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Pointer to the node being used as to query against v '
                }
              ]
            },
            type => 'Node *',
            initializer => '=nullptr'
          },
          {
            kind => 'variable',
            name => 'running',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Flag for if the graphcis should continue '
                }
              ]
            },
            type => 'bool',
            initializer => '= true'
          },
          {
            kind => 'variable',
            name => 'controller_used',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Flag for if the user has a controller '
                },
                {
                  type => 'linebreak'
                },
                {
                  type => 'text',
                  content => ' '
                }
              ]
            },
            type => 'bool',
            initializer => '= false'
          },
          {
            kind => 'variable',
            name => 'num_nodes',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => '! Algorithm Attributes ! Number of Nodes to draw '
                }
              ]
            },
            type => 'int',
            initializer => '= 200'
          },
          {
            kind => 'variable',
            name => 'k',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The k-paramater to determine stretch and samples '
                }
              ]
            },
            type => 'int',
            initializer => '= 3'
          },
          {
            kind => 'variable',
            name => 'additional_edges',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The number of additional edges to add to graph '
                }
              ]
            },
            type => 'int'
          },
          {
            kind => 'variable',
            name => 'stretch',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The stretch factor of the given k (2k-1) '
                }
              ]
            },
            type => 'unsigned int'
          },
          {
            kind => 'variable',
            name => 'n',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The number of Nodes in the graph (|V|) '
                }
              ]
            },
            type => 'unsigned int'
          },
          {
            kind => 'variable',
            name => 'm',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The number of edges in the graph (|E|) '
                }
              ]
            },
            type => 'unsigned int'
          },
          {
            kind => 'variable',
            name => 'view',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Current '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' the player has selected '
                },
                {
                  type => 'linebreak'
                },
                {
                  type => 'text',
                  content => ' '
                }
              ]
            },
            type => 'Node *',
            initializer => '= nullptr'
          },
          {
            kind => 'variable',
            name => 'closest',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Current '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' the player is hovering over '
                }
              ]
            },
            type => 'Node *',
            initializer => '= nullptr'
          },
          {
            kind => 'variable',
            name => 'dist_path',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The path taken by the ADO to calculate the distance '
                }
              ]
            },
            type => 'vector< Node * >'
          },
          {
            kind => 'variable',
            name => 'edges',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => '! Preproccessing Attributes ! The edges connecting the Nodes '
                }
              ]
            },
            type => 'vector< Edge >'
          },
          {
            kind => 'variable',
            name => 'adjacency_matrix',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'AM version of the edges constructed '
                }
              ]
            },
            type => 'vector< vector< double > >'
          },
          {
            kind => 'variable',
            name => 'V',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'List of all Nodes '
                }
              ]
            },
            type => 'vector< Node >'
          },
          {
            kind => 'variable',
            name => 'A',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The vector of all samples '
                }
              ]
            },
            type => 'vector< set< Node * > >'
          },
          {
            kind => 'variable',
            name => 'balls',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The vector of each '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => '\'s '
                },
                {
                  type => 'url',
                  link => 'struct_ball',
                  content => 'Ball'
                },
                {
                  type => 'text',
                  content => ' '
                }
              ]
            },
            type => 'vector< vector< Ball > >'
          },
          {
            kind => 'variable',
            name => 'p_i',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The vector of each '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => '\'s pivots for the balls '
                }
              ]
            },
            type => 'vector< vector< id_t > >'
          },
          {
            kind => 'variable',
            name => 'stored_distance',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The hashmap of all stored distances used in the query '
                }
              ]
            },
            type => 'unordered_map< id_t, unordered_map< id_t, dist_t > >'
          },
          {
            kind => 'variable',
            name => 'prob',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'The probability that a '
                },
                {
                  type => 'url',
                  link => 'struct_node',
                  content => 'Node'
                },
                {
                  type => 'text',
                  content => ' is sampled '
                }
              ]
            },
            type => 'double',
            initializer => '= 0.0'
          },
          {
            kind => 'variable',
            name => 'space',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => '! Statistics Attributes ! Number of distances stored '
                }
              ]
            },
            type => 'int',
            initializer => '= 0'
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'Screen',
      kind => 'struct',
      inner => [
      ],
      includes => {
        local => 'no',
        name => 'Includes.h'
      },
      all_members => [
        {
          name => 'getCenterX',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'getCenterY',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'getX',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'getXScale',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'getY',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'getYScale',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'HEIGHT',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'WIDTH',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'zoom_factor',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'zoom_x',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        },
        {
          name => 'zoom_y',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Screen'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'getCenterX',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getCenterY',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getXScale',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getYScale',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getX',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'x',
                type => 'const int'
              }
            ]
          },
          {
            kind => 'function',
            name => 'getY',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'y',
                type => 'const int'
              }
            ]
          }
        ]
      },
      public_members => {
        members => [
          {
            kind => 'variable',
            name => 'WIDTH',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            initializer => '= 1512'
          },
          {
            kind => 'variable',
            name => 'HEIGHT',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            initializer => '= 946'
          },
          {
            kind => 'variable',
            name => 'zoom_factor',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            initializer => '= 1.0'
          },
          {
            kind => 'variable',
            name => 'zoom_x',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            initializer => '= 0'
          },
          {
            kind => 'variable',
            name => 'zoom_y',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            initializer => '= 0'
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'Spritesheet',
      kind => 'class',
      inner => [
      ],
      includes => {
        local => 'no',
        name => 'Includes.h'
      },
      all_members => [
        {
          name => 'clip',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Spritesheet'
        },
        {
          name => 'drawArea',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Spritesheet'
        },
        {
          name => 'drawArea',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Spritesheet'
        },
        {
          name => 'drawSelectedSprite',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Spritesheet'
        },
        {
          name => 'drawSprite',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Spritesheet'
        },
        {
          name => 'freeMemory',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Spritesheet'
        },
        {
          name => 'renderer',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Spritesheet'
        },
        {
          name => 'selectSprite',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Spritesheet'
        },
        {
          name => 'Spritesheet',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Spritesheet'
        },
        {
          name => 'Spritesheet',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Spritesheet'
        },
        {
          name => 'spritesheet_image',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Spritesheet'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'Spritesheet',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'Spritesheet',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'path',
                type => 'char const *'
              },
              {
                declaration_name => 'renderer',
                type => 'SDL_Renderer *'
              },
              {
                declaration_name => 'width',
                type => 'const int',
                default_value => '32'
              },
              {
                declaration_name => 'height',
                type => 'const int',
                default_value => '32'
              }
            ]
          },
          {
            kind => 'function',
            name => 'freeMemory',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'selectSprite',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'x',
                type => 'int'
              },
              {
                declaration_name => 'y',
                type => 'int',
                default_value => '0'
              },
              {
                declaration_name => 'clip_x',
                type => 'int',
                default_value => '-1'
              },
              {
                declaration_name => 'clip_y',
                type => 'int',
                default_value => '-1'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawSelectedSprite',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'position',
                type => 'SDL_Rect *'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawSprite',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'position',
                type => 'SDL_Rect *'
              },
              {
                declaration_name => 'row',
                type => 'const int'
              },
              {
                declaration_name => 'pos',
                type => 'const int'
              },
              {
                declaration_name => 'size_x',
                type => 'const int',
                default_value => '32'
              },
              {
                declaration_name => 'size_y',
                type => 'const int',
                default_value => '32'
              },
              {
                declaration_name => 'offset',
                type => 'const int',
                default_value => '0'
              },
              {
                declaration_name => 'unscaledX',
                type => 'const int',
                default_value => '0'
              },
              {
                declaration_name => 'unscaledY',
                type => 'const int',
                default_value => '0'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawArea',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'position',
                type => 'SDL_Rect *'
              },
              {
                declaration_name => 'x',
                type => 'const int &'
              },
              {
                declaration_name => 'y',
                type => 'const int &'
              },
              {
                declaration_name => 'w',
                type => 'const int &'
              },
              {
                declaration_name => 'h',
                type => 'const int &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'drawArea',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'yes',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'position',
                type => 'SDL_Rect *'
              },
              {
                declaration_name => 'x',
                type => 'const int &'
              },
              {
                declaration_name => 'y',
                type => 'const int &'
              },
              {
                declaration_name => 'w',
                type => 'const int &'
              },
              {
                declaration_name => 'h',
                type => 'const int &'
              },
              {
                declaration_name => 'alpha',
                type => 'const Uint8'
              }
            ]
          }
        ]
      },
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'clip',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'SDL_Rect'
          },
          {
            kind => 'variable',
            name => 'spritesheet_image',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'SDL_Texture *'
          },
          {
            kind => 'variable',
            name => 'renderer',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'SDL_Renderer *'
          }
        ]
      },
      brief => {},
      detailed => {}
    }
  ],
  concepts => [
  ],
  modules => [
  ],
  namespaces => [
  ],
  files => [
    {
      name => 'Graphics.cpp',
      includes => [
        {
          name => 'Runner.h',
          ref => '_runner_8h'
        }
      ],
      included_by => [
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'Includes.h',
      includes => [
        {
          name => 'iostream'
        },
        {
          name => 'fstream'
        },
        {
          name => 'vector'
        },
        {
          name => 'unordered_map'
        },
        {
          name => 'set'
        },
        {
          name => 'sstream'
        },
        {
          name => 'queue'
        },
        {
          name => 'stack'
        },
        {
          name => 'cmath'
        },
        {
          name => 'math.h'
        },
        {
          name => 'random'
        },
        {
          name => 'algorithm'
        },
        {
          name => 'utility'
        },
        {
          name => 'filesystem'
        },
        {
          name => '../include/SDL2/SDL.h'
        },
        {
          name => '../include/SDL2_tff/SDL_ttf.h'
        },
        {
          name => '../include/SDL2_tff/SDL_FontCache.h'
        },
        {
          name => '../include/SDL2_image/SDL_image.h'
        },
        {
          name => '../include/SDL2/SDL_gamecontroller.h'
        }
      ],
      included_by => [
        {
          name => 'Runner.h',
          ref => '_runner_8h'
        }
      ],
      defines => {
        members => [
          {
            kind => 'define',
            name => 'pastWait',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            parameters => [
              {
                name => 'h'
              },
              {
                name => 't'
              },
              {
                name => 'w'
              }
            ],
            initializer => '(h? (t - h >= w) : (false))'
          },
          {
            kind => 'define',
            name => 'calcDist',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            parameters => [
              {
                name => 'x1'
              },
              {
                name => 'y1'
              },
              {
                name => 'x2'
              },
              {
                name => 'y2'
              }
            ],
            initializer => '((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))'
          }
        ]
      },
      typedefs => {
        members => [
          {
            kind => 'typedef',
            name => 'Target',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'SDL_Rect'
          },
          {
            kind => 'typedef',
            name => 'tick_t',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'uint32_t'
          },
          {
            kind => 'typedef',
            name => 'ID_t',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int'
          },
          {
            kind => 'typedef',
            name => 'dist_t',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          }
        ]
      },
      enums => {
        members => [
          {
            kind => 'enum',
            name => 'PointState',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            values => [
              {
                name => 'BLANK',
                brief => {},
                detailed => {}
              },
              {
                name => 'SELECTED_V',
                brief => {},
                detailed => {}
              },
              {
                name => 'SELECTED_U',
                brief => {},
                detailed => {}
              },
              {
                name => 'SAMPLED',
                brief => {},
                detailed => {}
              }
            ]
          }
        ]
      },
      variables => {
        members => [
          {
            kind => 'variable',
            name => 'JOYSTICK_DEADZONE',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const int',
            initializer => '= 16000'
          },
          {
            kind => 'variable',
            name => 'CURSOR_SPEED',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'constexpr int',
            initializer => '= 5'
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'main.cpp',
      includes => [
        {
          name => 'Runner.h',
          ref => '_runner_8h'
        }
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'main',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'argc',
                type => 'int'
              },
              {
                declaration_name => 'argv',
                type => 'char *',
                array => '[]'
              }
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'Oracle.cpp',
      includes => [
        {
          name => 'Runner.h',
          ref => '_runner_8h'
        }
      ],
      included_by => [
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'Runner.h',
      includes => [
        {
          name => 'Includes.h',
          ref => '_includes_8h'
        }
      ],
      included_by => [
        {
          name => 'Graphics.cpp',
          ref => '_graphics_8cpp'
        },
        {
          name => 'Oracle.cpp',
          ref => '_oracle_8cpp'
        },
        {
          name => 'UserInput.cpp',
          ref => '_user_input_8cpp'
        },
        {
          name => 'main.cpp',
          ref => 'main_8cpp'
        }
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'UserInput.cpp',
      includes => [
        {
          name => 'Runner.h',
          ref => '_runner_8h'
        }
      ],
      included_by => [
      ],
      brief => {},
      detailed => {}
    }
  ],
  groups => [
  ],
  pages => [
  ]
};
1;
